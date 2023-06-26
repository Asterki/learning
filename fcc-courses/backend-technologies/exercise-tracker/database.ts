import mongoose from 'mongoose';

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

// Create the schemas that we're gonna use
const userSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
    },
});
const userModel = mongoose.model('exercise-users', userSchema, 'exercise-users');

const logSchema = new mongoose.Schema({
    username: {
        type: String,
    },
    description: {
        type: String,
    },
    duration: {
        type: Number,
    },
    date: {
        type: Date,
    },
});
const logsModel = mongoose.model('exercise-logs', logSchema, 'exercise-logs');

export { userModel, logsModel };
