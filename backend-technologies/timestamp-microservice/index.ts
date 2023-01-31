import express from 'express';
import cors from 'cors';

const app: express.Application = express();

// Add cors
app.use(cors());

// Frontend
app.use(express.static('./public'));

// Declare the API routes
app.get('/api/:date', (req: express.Request, res: express.Response) => {
    let date: Date;

    if (/\d{5,}/.test(req.params.date)) {
        date = new Date(parseInt(req.params.date)); // Unix based date
    } else {
        date = new Date(req.params.date);
    }

    // Check if it's am invalid date
    if (isNaN(date.getTime())) return res.send({ error: 'Invalid Date' });
    res.send({ unix: date.valueOf(), utc: date.toUTCString() });
});

// No date provided
app.get('/api/', (req: express.Request, res: express.Response) => {
    const date = new Date(Date.now());

    res.send({ unix: date.valueOf(), utc: date.toUTCString() });
});

app.listen(process.env.PORT || 8080, () => {
    console.log(`Server listening at port ${process.env.PORT || 8080}`);
});
