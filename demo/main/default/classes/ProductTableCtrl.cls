public with sharing class ProductTableCtrl {
  @AuraEnabled(cacheable=true)
  public static List<Product2> getProducts(Integer rowLimit) {
    try {
      return [
        SELECT
          Id,
          // CurrencyIsoCode,
          UnitPrice,
          Product2.Name,
          Product2.Description,
          Product2.IsActive,
          Product2.ProductCode,
          Product2.Family,
          Product2.DescriptionLong__c,
          Product2.ValidUntilDate__c,
          Product2.PurchaseCount__c,
          Product2.Term__c
        FROM PricebookEntry
        WHERE Product2.ProductCode LIKE '%searchTerm%'
        WITH SECURITY_ENFORCED
        LIMIT :rowLimit
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
