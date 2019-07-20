package vo;

public class Item {
    private int id;
    private String name;
    private String image;
    private String description;
    private String address;
    private String date;
    private String video;
    private int hot;
    private String IMG_SRC="img/item/";

    public Item(int id, String name, String image, String description, String address, String date, String video, int hot) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.description = description;
        this.address = address;
        this.date = date;
        this.video = video;
        this.hot = hot;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHot() {
        return hot;
    }

    public void setHot(int hot) {
        this.hot = hot;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return IMG_SRC + image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

}
