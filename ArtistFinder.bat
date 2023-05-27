cd /d %~dp0
start cmd.exe /k "pip install -r requirements.txt"
start cmd.exe /k "cd backend && python manage.py runserver"
start cmd.exe /k "cd artist_finder && flutter run && 1"