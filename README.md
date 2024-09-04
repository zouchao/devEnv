# 打造vscode rails的开发环境

## 安装vscode

https://code.visualstudio.com/download

## 安装相应插件

1. ms-vscode-remote.vscode-remote-extensionpack (这是一个插件包)
2. Shopify.ruby-extensions-pack (ruby的插件包)
3. koichisasada.vscode-rdbg (ruby debug插件)

## build image

```bash
docker compose build
```

## 引入项目

### Example:

#### 目录结构:

```
example-project-dir
├──.devcontainer 
│   ├── devcontainer.json 
│   └── Dockerfile
└── .vscode
    ├── settings.json
    ├── launch.json
    └── extensions.json
```

#### .vscode/setting.json
```json
{
    "[ruby]": {
      "editor.defaultFormatter": "Shopify.ruby-lsp",
      "editor.formatOnSave": true,
      "editor.formatOnType": true,
      "editor.insertSpaces": true,
      "files.trimTrailingWhitespace": true,
      "files.insertFinalNewline": true,
      "files.trimFinalNewlines": true,
      "editor.semanticHighlighting.enabled": true,
      "editor.rulers": [80, 120]
    },
    "rubyLsp.formatter": "rubocop",
    "rubyLsp.bundleGemfile": "/project/ruby-extensions/Gemfile",
    "rubyLsp.testTimeout": 60
}
```

#### .vscode/extensions.json

```json
{
    "recommendations": [
        "ms-vscode-remote.vscode-remote-extensionpack", // remote dev的插件包
        // "Shopify.ruby-extensions-pack", // ruby的插件包
        // "koichisasada.vscode-rdbg" // ruby debug 插件
    ]
}
```

#### Dockerfile

```Dockerfile
FROM devenv-ruby:latest

COPY . /project/
# RUN rbenv install 2.7.6  # 如果你需要安装不同版本的 ruby
RUN gem install bundler && bundle install

WORKDIR /app/example-project-dir

CMD ['rails', 'server', '-b', '0.0.0.0']
```


