import express from 'express';
import cors from 'cors';
import mongoose from 'mongoose';
import validator from 'validator';

// Load environment variables
import * as dotenv from 'dotenv';
dotenv.config({ path: './.env' });

// Connect to the database
mongoose.set('strictQuery', false);
mongoose.connect(
    process.env.MONGODB_URI as string,
    { useUnifiedTopology: true, useNewUrlParser: true } as mongoose.ConnectOptions
);
const mongooseClient = mongoose.connection;

// Events for the mongoose client
mongooseClient.once('open', () => {
    console.log(`MongoDB database connected`);
});

mongooseClient.once('error', (error: Error) => {
    console.log(`There was an error with the mongoose client`);
    console.log(error);
});

// Schema
const URLShortenerSchema = new mongoose.Schema({
    original_url: String,
    short_url: Number,
});
const URLShortener = mongoose.model('URLShortener', URLShortenerSchema, 'url-shortener');

// Server
const app: express.Application = express();

// Add cors and frontend
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('./public'));

// Declare the API routes
app.post('/api/shorturl', async (req: express.Request, res: express.Response) => {
    // Verify that the url is valid
    if (!validator.isURL(req.body.url, { protocols: ['http', 'https'] }))
        return res.send({ error: 'invalid url' });

    const count = (await URLShortener.count({})) + 1;

    const url = new URLShortener({
        original_url: req.body.url,
        short_url: count,
    });

    await url.save();
    res.send({ original_url: req.body.url, short_url: count });
});

app.get('/api/shorturl/:urlID', async (req: express.Request, res: express.Response) => {
    const shortenedURL = await URLShortener.findOne({ short_url: req.params.urlID });
    if (shortenedURL?.original_url == undefined) return res.send({ error: 'invalid url' });

    res.redirect(shortenedURL.original_url);
});

// Start the server
app.listen(process.env.PORT || 8080, () => {
    console.log(`Server listening at port ${process.env.PORT || 8080}`);
});
