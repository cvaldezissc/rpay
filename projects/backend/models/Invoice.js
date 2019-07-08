/**
 * Invoices Model
 */

const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const InvoicesSchema  = new Schema({
    user: { type: Schema.Types.ObjectId, ref: 'user' },
    customer: { type: Schema.Types.ObjectId, ref: 'customer' },
    fiscalInfo: { type: Schema.Types.ObjectId, ref: 'fiscalInfo' },
    internalUUID: { type: String, required: true },
    products: [{ type: Number } , { type: Schema.Types.ObjectId, ref: 'product' }],
    taxes: { type: Number, required: true },
    vat: { type: Number, required: true },
    ieps: { type: Number, required: true },
    totalAmount: { type: Number, required: true },
    digitalLabel: { type: String, required: true },
    fileName: { type: String, required: true },
    invoiceFileURL: { type: String, required: true },
    creationModificationDate: { type: Date, default: Date.now() },
    lastModifier: { type: Schema.Types.ObjectId, ref: 'user' },
    status: { type: Number, default: 1 }
});


module.exports = mongoose.model('invoice', InvoicesSchema);