#!/bin/bash
PROJECT=$1

start_mobile_session () {
  MOBILE_PATH=$WORK_CODE_PATH/$1-mobile
  mdfind -name $MOBILE_PATH
  FOUND=$?
  if [ -n "${FOUND-}" ]; then
    tmux new-session -d -s mobile -c $MOBILE_PATH \; \
      split-window -h -p 25 -c $MOBILE_PATH \; \
      select-pane -t 0 \; \
      send-keys 'vim . ' C-m  \; \
      split-window -v -p 30 -c $MOBILE_PATH \; \
      select-pane -t 1 \; \
      send-keys 'yarn start' C-m  \; \
      select-pane -t 2 \; \
      send-keys 'yarn ios' C-m \;
  fi
}

start_backend_session () {
  BACKEND_PATH=$WORK_CODE_PATH/$1-backend
  mdfind -name $BACKEND_PATH
  FOUND=$?
  if [ -n "${FOUND-}" ]; then
    tmux new-session -d -s backend -c $BACKEND_PATH \; \
      split-window -h -p 25 -c $BACKEND_PATH \; \
      select-pane -t 0 \; \
      send-keys 'vim .' C-m  \; \
      split-window -v -p 30 -c $BACKEND_PATH \; \
      select-pane -t 1 \; \
      send-keys 'docker-compose up' C-m  \; \
      select-pane -t 2 \; \
      send-keys 'docker-compose exec python bash' C-m \;
  fi
}

start_mobile_session $PROJECT

start_backend_session $PROJECT

tmux attach-session -t backend