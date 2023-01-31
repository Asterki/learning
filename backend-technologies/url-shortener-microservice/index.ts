import express from 'express';
import cors from 'cors';

const app: express.Application = express();

// Add cors
app.use(cors());

// Frontend
app.use(express.static('./public'));

// Declare the API routes
app.get('/api/whoami', (req: express.Request, res: express.Response) => {
    
});

app.listen(process.env.PORT || 8080, () => {
    console.log(`Server listening at port ${process.env.PORT || 8080}`);
});
