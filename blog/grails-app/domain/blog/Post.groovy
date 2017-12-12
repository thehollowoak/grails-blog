package blog

class Post {

    String title
    Date date
    String content
    String author

    static constraints = {

    }
    static mapping ={
        content sqlType: 'varchar(10000)'
    }

    
}
