public class SortOfContactListController {
        public List<Contact> ContactListTable {get; set;}
        public String ExpressionOfSort = 'name';
        public String DirectionOfSort = 'ASC';

        public SortOfContactListController() {
            ContactListTable = new List<Contact>();
        }
        public String ExpressionSort {
            get {
                return ExpressionOfSort;
            }
            set {
                If(value == ExpressionOfSort) {
                    DirectionOfSort = (DirectionOfSort == 'ASC')? 'DESC' : 'ASC';
                }
                else {
                    DirectionOfSort = 'ASC';
                    ExpressionOfSort = value;
                }
            }

        }

        public String getDirectionOfSort() {
            If(ExpressionOfSort == Null || ExpressionOfSort == '') {
                return 'DESC';
            }
            else {
                return DirectionOfSort;
            }
        }

        public void setDirectionOfSort(String value) {
            DirectionOfSort = value;
        }

        public List<Contact>getContacts() {
            return ContactListTable;
        }

        public PageReference ViewData() {
            String FullSortExpression = ExpressionOfSort + ' ' + DirectionOfSort;
            system.debug('ExpressionOfSort:::::'+ExpressionOfSort);
            system.debug(DirectionOfSort);

            //String Queryitem = new String();
           String Queryitem = 'SELECT Id, Name, Account.Name, Birthdate, Phone, Email, MailingCity, MailingCountry, MailingPostalCode FROM Contact WHERE Account.Name != Null ORDER BY ' + FullSortExpression + ' Limit 1000';

            ContactListTable = DataBase.query(Queryitem);
            system.debug(ContactListTable);
            return Null;
        }
    }