/**
 * Subsidiaries Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const SubsidiarySchema  = new Schema({
    fiscalInfo: { type: Schema.Types.ObjectId, ref: 'fiscalinformation' },
    subsidiaryName: { type: String, required: true },
    subsidiaryType: { type: Schema.Types.ObjectId, ref: 'genericcatalog' },
    account: { type: Number, default: 0 },
    serie: { type: Number, required: true, default: 0},
    creationDate: { type: Date, default: Date.now() },
    modificationDate: {type: Date, default: Date.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user'},
    status: { type: Number, required: true, default: 1 }
});


module.exports = mongoose.model('subsidiary', SubsidiarySchema);