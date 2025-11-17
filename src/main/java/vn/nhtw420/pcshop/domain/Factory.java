package vn.nhtw420.pcshop.domain;

import jakarta.persistence.*;

import java.util.List;

@Entity
@Table(name = "factories")
public class Factory {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(nullable = false, unique = true)
    private String name;

    @OneToMany(mappedBy = "factory")
    private List<Product> products;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Factory{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
