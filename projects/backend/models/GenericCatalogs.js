/**
 * Generic Catalogs Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const GenericCatalogsSchema  = new Schema({
    key: { type: String, required: true },
    description: { type: String, required: true },
    value: { type: String, required: true },
    creator: { type: Schema.Types.ObjectId, ref: 'user' },
    creationDate: { type: Date, required: true },
    modificationDate: { type: Date, default: Date.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('genericcatalog', GenericCatalogsSchema);