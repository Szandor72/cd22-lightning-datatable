public with sharing class ProductTableCtrl {
  @AuraEnabled(cacheable=true)
  public static List<Product2> getProducts(Integer rowLimit) {
    try {
      return [
        SELECT Id, Name, Description, IsActive, ProductCode, Family
        FROM Product2
        WITH SECURITY_ENFORCED
        LIMIT :rowLimit
      ];
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
