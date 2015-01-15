public void setup()
{
  size(800, 800);
  background(255);
  stroke(0);
  fill(255, 0, 0);
  textSize(25);
  t = new ArrayList<String>();
}

public int iter = 10; 
public float initAngle = -PI/2, initLen = 200;
public ArrayList<String> t;
public void draw()
{
  background(255);
  branch(400, 800, initAngle, initLen, iter);
  t.clear();
  t.add("[I][O] Zoom: " + initLen/200);
  t.add("[Z][X] Fractal multiplier: " + persistence);
  t.add("[R][T] Tilt: " + (initAngle + PI/2));
  t.add("[W][S] Iterations " + iter);
  t.add("[Q][E] Angle increment: " + angleStep);

  for (int i = 0; i < t.size (); i++)
  {
    text(t.get(i), 50, height - 50 - 30*i);
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

public float angleStep = PI/8, persistence = 0.75;
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

