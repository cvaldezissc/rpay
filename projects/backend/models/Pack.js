/**
 * Packs Model
 */
const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const PackSchema  = new Schema({
    name: { type: String, required: true },
    description: { type: String, required: true },
    availableFolios: { type: Number, required: true },
    isValid: { type: Boolean, default: true },
    activationDate: { type: Date, default: Date.now() },
    expirationDate: { type: Date, required: true },
    creationDate: { type: Date, default: Date.now() },
    modificationDate: { type: Date, required: true },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user'},
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('pack', PackSchema);