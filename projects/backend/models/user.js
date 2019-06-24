const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const Schema = mongoose.Schema;


const UserSchema = new Schema({
    email: { type: String, required: true },
    password: { type: String, required: true, select: false },
    name: { type: String, required: true },
    createdAt: { type: Date, default: Date.now() },
    following: [{type: Schema.Types.ObjectId, ref: "user"}]
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

// module.exports.encryptPassword2 = async (password) => {
//     const salt = await bcrypt.genSalt(5);
//     const hash = await bcrypt.hash(password, salt);
//     return hash;
// };

// module.exports.validatePasswords2 = async (candidatePassword) => {
//     const result = await bcrypt.compare(candidatePassword, this.password);
//     return result;
// };

module.exports = mongoose.model('user', UserSchema);