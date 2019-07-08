/**
 * FiscalInfo Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const FiscalinfoSchema  = new Schema({
    user: { type: Schema.Types.ObjectId, ref: "user" },
    rfc: { type: String, required: false },
    businessName: { type: String, required: false },
    responsibleName: { type: String, required: false },
    personType: { type: Schema.Types.ObjectId, ref: "genericcatalog" },
    creationDate: { type: Date, default: Date.now() },
    modificationDate: { type: Date, default: Date.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
    status: { type: Number, default: 1 }
});

module.exports = mongoose.model('fiscalinformation', FiscalinfoSchema);