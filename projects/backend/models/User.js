const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const Schema = mongoose.Schema;


const UserSchema = new Schema({

    firstName: { type: String, required: true },
    lastName: { type: String, required: true },
    fullName: { type: String, required: true, default: firstName + " " + lastName },
    email: { type: String, required: true },
    password: { type: String, required: true, select: false },
    isAdmin: { type: Boolean, required: true, default: false },
    createdAt: { type: Date, default: Date.now() },
    modifiedAt: { type: Date, default: Date.now() },
    status: { type: Number, default: 1 }
});

UserSchema.methods.encryptPassword = async (password) => {
    const salt = await bcrypt.genSalt(5);
    const hash = await bcrypt.hash(password, salt);
    return hash;
};

UserSchema.methods.validatePasswords = async (candidatePassword, currentDBPassword) => {
    const result = await bcrypt.compare(candidatePassword, currentDBPassword);
    return result;
};

UserSchema.methods.validPassword = async (candidatePassword) => {
    const result = await bcrypt.compare(candidatePassword, this.password);
    return result;
};



module.exports = mongoose.model('user', UserSchema);