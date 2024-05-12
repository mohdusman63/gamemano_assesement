const express = require('express');
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient();

async function main() {
    try {
        const user = await prisma.user.create({
            data: {
                email: 'abc@gmail.com',
                name: 'test',
                password: 'password' // Corrected the field name to 'password'
            }
        });
        console.log(user);
    } catch (error) {
        console.error(error);
    } finally {
        await prisma.$disconnect();
    }
}

// main();

const app = express();

app.use(express.json());
const route = require('./routes/authRoute');
app.use(route)

// Define your routes and controllers here

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
