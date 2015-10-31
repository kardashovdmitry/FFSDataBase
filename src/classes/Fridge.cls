public class Fridge implements KitchenUtility{
    private String modelNumber;
	private Integer numberInStock;
    public static final Integer STOCK_THRESHOLD = 5;
    
    public Fridge(){
        modelNumber = 'XX-XX';
		numberInStock = 0;
    }
    
    public Fridge(String mNumber, Integer nInStock){
        modelNumber = mNumber;
		numberInStock = nInStock;
    }
    
    public void updateStock(Integer justSold){
		numberInStock = numberInStock - justSold;
	}
    
    public void setModelNumber(String newModelNumber){
        modelNumber = newModelNumber;
    }
    
    public String getModelNumber(){
        return modelNumber;
    }
    
    public static void toDebug(Fridge aFridge){
		System.debug('ModelNumber = ' + aFridge.modelNumber);
		System.debug('Number in Stock = ' + aFridge.numberInStock);
	}
    
    public Integer ecoRating{
		get { return ecoRating; }
		set { ecoRating = value; if(ecoRating < 0) ecoRating = 0;}
	}

}