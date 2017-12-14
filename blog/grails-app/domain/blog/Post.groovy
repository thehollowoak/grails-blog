package blog

class Post {

    String title
    Date date
    String content
    String author

    static constraints = {

    }
    static mapping ={
        content sqlType: 'varchar(100000)'
    }

    def formatURL(){
        title.replaceAll("\\s", "-")replaceAll("[^0-9a-zA-Z\\-]", "")
    }

    
}
