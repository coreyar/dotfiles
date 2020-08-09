#!/bin/bash
PROJECT=$1
ATTACH="attach"

start_session () {
    SESSION_NAME=`basename "$1"`
    echo creating session $SESSION_NAME;
   tmux new-session -d -s $SESSION_NAME -c "$1" \; \
     split-window -h -p 25 -c "$1" \; \
     select-pane -t 0 \; \
     send-keys 'vim . ' C-m  \; \
     split-window -v -p 25 -c "$1" \; \
     select-pane -t 1 \; \
     send-keys "$2" C-m  \; \
     select-pane -t 2 \; \
     send-keys "$3" C-m \; \
     select-pane -t 0 \;
     # Windows aren't splitting just right. Manually resize
     tmux attach-session -t `basename "$SESSION_NAME"` \; \
       resize-pane -t 1 -R 30 \; \
       resize-pane -t 0 -D 5 \;

    if [ "$4" != "$ATTACH" ]; then
      tmux detach
    fi
}


MOBILE_PROJECT_PATH=$WORK_CODE_PATH/$PROJECT-mobile
if [ -d "$MOBILE_PROJECT_PATH" ]; then
  FIRST_COMMAND="yarn start"
  SECOND_COMMAND="yarn ios"
  start_session "$MOBILE_PROJECT_PATH" "$FIRST_COMMAND" "$SECOND_COMMAND"
fi

BACKEND_PROJECT_PATH=$WORK_CODE_PATH/$PROJECT-backend
if [ -d "$BACKEND_PROJECT_PATH" ]; then
  FIRST_COMMAND="docker-compose up"
  SECOND_COMMAND="docker-compose exec python bash"
  start_session "$BACKEND_PROJECT_PATH" "$FIRST_COMMAND" "$SECOND_COMMAND" "$ATTACH"
fi

case $PROJECT  in
  "penny")
    PROJECT_PATH=~/code/penny_university
    start_session "$PROJECT_PATH" "workon penny_university-Ly-e9GwL && python ./manage.py runserver" "cd $PROJECT_PATH/penny_university_frontend && yarn start" "$ATTACH"
    ;;
  *) 
esac 
