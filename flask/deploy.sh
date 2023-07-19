#! /bin/bash
pgrep flask
if [[ "$?" == 0 ]]; then
  sudo pkill flask
fi
cd flask
nohup flask run --host=0.0.0.0 &
FLASK_PID=$!

# Wait for the Flask application to start
for _ in {1..30}; do
  sleep 1
  curl -s http://localhost:5000 >/dev/null && break
done

# Check if the application started successfully
if [[ "$?" == 0 ]]; then
  # The application started successfully
  exit 0
else
  # The application failed to start within the timeout
  sudo pkill -P $FLASK_PID
  exit 1
fi
