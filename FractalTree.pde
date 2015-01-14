public void setup()
{
  size(800,800);
  background(255);
  stroke(0);
  fill(0);
  textSize(25);
}

public int iter = 5; public float initAngle = -PI/2, initLen = 200;
public ArrayList<String> text = new ArrayList<String>();
public void draw()
{
  background(255);
  branch(400, 600, initAngle, initLen, iter);
  text.clear();
  text.add("[Q][E] Angle increment: " + angleStep);
  text.add("[W][S] Iterations " + iter);
  text.add("[R][T] Tilt: " + (initAngle + PI/2));
  text.add("[Z][X] Fractal multiplier: " + persistence);
  text.add("[I][O] Zoom: " + initLen/200);
  for (int i = 0; i < text.size(); i++)
  {
    text(text.get(i), 50, 50 + 30*i);
  }
}

public void keyPressed()
{
  if (key == 'q') 
    angleStep -= PI/72;
  else if (key == 'e') 
    angleStep += PI/72;
  else if (key == 'w') 
    iter++;
  else if (key == 's') 
    iter--;
  else if (key == 'r') 
    initAngle -= PI/24;
  else if (key == 't') 
    initAngle += PI/24;
  else if (key == 'z')
    persistence -= 0.05;
  else if (key == 'x')
    persistence += 0.05;
  else if (key == 'i')
    initLen += 10;
  else if (key == 'o')
    initLen -= 10;
}

public float angleStep = PI/8, persistence = 0.5;
public void branch(float x1, float y1, float angle, float len, int iter)
{
  float x2 = x1 + len*cos(angle), y2 = y1 + len*sin(angle);
  line(x1, y1, x2, y2);
  if (--iter > 0)
  {
    branch(x2, y2, angle + angleStep, len*persistence, iter);
    branch(x2, y2, angle - angleStep, len*persistence, iter);
  }
}

