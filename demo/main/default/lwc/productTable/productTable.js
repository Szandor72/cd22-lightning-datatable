import { LightningElement, wire } from "lwc";
import getProducts from "@salesforce/apex/ProductTableCtrl.getProducts";

const COLUMNS = [
  { label: "Name", fieldName: "Name" },
  { label: "Product Code", fieldName: "ProductCode" },
  { label: "Active", fieldName: "IsActive", type: "boolean" },
  { label: "Description", fieldName: "Description" }
];

export default class ProductTable extends LightningElement {
  @wire(getProducts, { rowLimit: "$rowLimit" })
  wiredProducts;

  columns = COLUMNS;

  rowLimit = 50000;

  renderConfig = {
    virtualize: "vertical"
    // additional customization
  };

  onRowLimitChange(event) {
    this.rowLimit = event.target.value;
  }

  onRowSelection(event) {
    const selectedRows = event.target.selectedRows;
    alert(selectedRows);
  }
}
