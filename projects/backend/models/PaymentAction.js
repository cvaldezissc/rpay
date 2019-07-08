/**
 * Payments and Actions Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const PaymentActionSchema  = new Schema({
    user: { type: Schema.Types.ObjectId, ref: 'user' },
    fiscalInfo: { type: Schema.Types.ObjectId, ref: 'fiscalinfo' },
    pack: { type: Schema.Types.ObjectId, ref: 'pack' },
    sentAmount: { type: String, required: true },
    reference: { type: String, required: true },
    sentComment: { type: String, required: true },
    creationDate: { type: Date, default: Date.now() },
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('paymentaction', PaymentActionSchema);