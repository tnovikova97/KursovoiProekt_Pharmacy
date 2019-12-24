package pharmacy.model;
/*
 *  @created 23.12.2019
 *  @project pharmacy
 *  @author Татьяна
 */


import javax.persistence.*;
import java.sql.Date;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table
public class Medicament {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "title")
    private String title;

    @Column(name = "price")
    private int price;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "date_start")
    private Date dateStart;

    @Column(name = "date_end")
    private Date dateEnd;

    @Column(name = "company")
    private String company;

    @Column(name = "description")
    private String description;

    public Medicament() {
    }

    public Medicament(String title, int price, int quantity, Date dateStart, Date dateEnd, String company, String description) {
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.company = company;
        this.description = description;
    }

    public Medicament(int id, String title, int price, int quantity, Date dateStart, Date dateEnd, String company, String description) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.quantity = quantity;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
        this.company = company;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getDateStart() {
        return dateStart;
    }

    public void setDateStart(Date dateStart) {
        this.dateStart = dateStart;
    }

    public Date getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(Date dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Medicament{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", quantity=" + quantity +
                ", dateStart=" + dateStart +
                ", dateEnd=" + dateEnd +
                ", company='" + company + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
