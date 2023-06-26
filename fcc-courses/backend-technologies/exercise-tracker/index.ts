import express from 'express';
import cors from 'cors';

import { userModel, logsModel } from './database';

// Load environment variables
import * as dotenv from 'dotenv';
dotenv.config({ path: './.env' });

// Create Server
const app: express.Application = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('./public'));

require('./database'); // Start the database

// Create a user
app.post('/api/users', async (req, res) => {
    if (!req.body.username) return res.status(400);

    const user = new userModel({
        username: req.body.username,
    });
    await user.save();

    res.send(user);
});

// Get all users
app.get('/api/users', async (req, res) => {
    const users = await userModel.find();
    res.send(users);
});

// Add exercise
app.post('/api/users/:id/exercises', async (req, res) => {
    // I'd generally use zod for this part
    if (!req.body.description || !req.body.duration) return res.status(400);

    const user = await userModel.findById(req.params.id);
    if (!user) return res.status(400);

    const newLog = new logsModel({
        username: user.username,
        duration: parseInt(req.body.duration),
        description: req.body.description,
        date: req.body.date == undefined ? new Date(Date.now()) : new Date(req.body.date),
    });

    res.send({
        username: user.username,
        description: newLog.description,
        duration: newLog.duration,
        date: newLog.date?.toDateString(),
        _id: user._id,
    });

    newLog.save();
    user.save();
});

// Get Exercises
app.get('/api/users/:_id/logs', async (req, res) => {
    if (!req.params._id) return res.status(400);

    const user = await userModel.findById(req.params._id);
    if (!user) return res.status(400);

    let logs: any;

    if (req.query.from !== undefined && req.query.to !== undefined) {
        logs = await logsModel.find({
            username: user.username,
            date: {
                $gte: new Date(req.query.from as string),
                $lt: new Date(req.query.to as string),
            },
        });
    } else if (req.query.limit !== undefined) {
        logs = await logsModel
            .find({
                username: user.username,
            })
            .limit(req.query.limit == undefined ? 100 : parseInt(req.query.limit as string));
    } else {
        logs = await logsModel.find({
            username: user.username,
        });
    }

    return res.send({
        username: user.username,
        count: logs.length,
        log: logs.map((log: any) => {
            return {
                username: log.username,
                description: log.description,
                duration: log.duration,
                date: new Date(log.date).toDateString()
            }
        }),
    });
});

// Start the server
app.listen(process.env.PORT || 8080, () => {
    console.log(`Server listening at port ${process.env.PORT || 8080}`);
});
