class Staff {

private:
    std::string title;

public:
    void setTitle(std::string title);
    std::string getTitle();
    Staff();
};

Staff::Staff() {
    this->title = "NA";
}

void Staff::setTitle(std::string title) {
    this->title = title;
}

std::string Staff::getTitle() {
    return this->title;
}