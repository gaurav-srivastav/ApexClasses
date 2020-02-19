public class AccountSortHeader {
public List<Account> allAcc {get;set;}
    public String sortDirection {get;set;}
    
    public AccountSortHeader()
    {
        sortDirection = 'asc';
        String query = 'Select Id, name from Account order by Name ' + sortDirection;
        allAcc = Database.query(query);
    }
    
    public pageReference sortAccNamecolumn()
    {
        if(sortDirection == 'asc')
        {
            sortDirection = 'desc';
        }
        else if(sortDirection == 'desc')
        {
            sortDirection = 'asc';
        }
        String query = 'Select Id, name from Account order by Name ' + sortDirection;
        allAcc = Database.query(query);
        return null;
    }
}