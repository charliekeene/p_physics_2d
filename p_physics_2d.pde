public ArrayList<Button> buttons = new ArrayList<Button>();

void setup(){
    fullScreen();
}

void draw(){
    background(0);
    for(Button b : buttons){
        b.drawButton();
    }
}

void mouseClicked(){
    for(int i = 0; i < buttons.size(); i++){
        buttons.get(i).detectPress(mouseX, mouseY);
    }
}

void keyPressed(){
    buttons.add(new Button(mouseX, mouseY, 50));
}

class Button{

    int x, y, size;

    Button(int x, int y, int size){
        this.x = x;
        this.y = y;
        this.size = size;
    }

    public void detectPress(int mx, int my){
        if(mx > x && mx < x + size && my > y && my < y + size){
            onPress();
        }
    }

    public void drawButton(){
        fill(255);
        rect(x-5, y-5, size+10, size+10);
        fill(0);
        rect(x,y,size,size);
    }

    public void onPress(){
        buttons.remove(this);
    }

}