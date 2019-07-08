/**
 * Certificates Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const CertificateSchema  = new Schema({
        user: { type: Schema.Types.ObjectId, ref: 'user' },
        fileName: { type: String, required: true },
        cerFileURL: { type: String, required: true },
        keyFileURL: { type: String, required: true },
        sdgFileURL: { type: String, required: true },
        privateKeyPassword: { type: String, required: true },
        creationDate: { type: Date, default: Date.now() },
        modificationDate: { type: Date, default: Date.now() },
        lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
        status: { type: Number, default: 1 }
    });


module.exports = mongoose.model('certificate', CertificateSchema);