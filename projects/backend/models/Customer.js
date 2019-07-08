/**
 * Customers Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const CustomerSchema  = new Schema({
    user: { type: Schema.Types.ObjectId, ref: 'user' },
    name: { type: Date, required: true },
    businessName: { type: Date, default: Date.now() },
    rfc: { type: String, required: true },
    address: { type: String, required: true },
    email: { type: String, required: true },
    creationDate: { type: Date, default: Date.now() },
    modificationDate: { type: Date, default: Date.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('customer', CustomerSchema);