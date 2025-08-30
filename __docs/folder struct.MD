my-python-func-app/
├── .vscode/
│   ├── extensions.json
│   ├── launch.json
│   ├── settings.json
│   └── tasks.json
├── function_app/
│   ├── __init__.py
│   ├── function_app.py          # Main entry point
│   ├── http_trigger/
│   │   ├── __init__.py
│   │   └── function.json
│   ├── timer_trigger/
│   │   ├── __init__.py
│   │   └── function.json
│   └── shared/                  # Shared utilities
│       ├── __init__.py
│       ├── models.py
│       ├── utils.py
│       └── config.py
├── tests/
│   ├── __init__.py
│   ├── test_http_trigger.py
│   └── test_timer_trigger.py
├── requirements.txt
├── host.json
├── local.settings.json
├── .gitignore
├── .funcignore
├── Dockerfile                   # For containerization
└── README.md