import express from 'express';
import cors from 'cors';
import multer from 'multer';

const app: express.Application = express();
const upload = multer({ dest: 'uploads/' }).single('upfile');

// Add cors
app.use(cors());

// Frontend
app.use(express.static('./public'));

app.post('/api/fileanalyse', (req, res) => {
    upload(req, res, (err) => {
        if (err) return res.status(500);

        return res.send({
            name: req.file?.originalname,
            type: req.file?.mimetype,
            size: req.file?.size,
        });
    });
});

app.listen(process.env.PORT || 8080, () => {
    console.log(`Server listening at port ${process.env.PORT || 8080}`);
});
