# Docker Gitbook PDF Generator

> 如果你想使用 GitBook 生成 PDF ，又不想折腾，使用这个项目就对啦！

众所周知 GitBook 新版本调用 `calibre` 生成的 PDF 尺寸比较大，而且不支持 PDF 压缩，非常不利于传播。

经过简单的寻找，我看到 **fuergaosi233** 同学用 Python 基于 `weastprint` 编写了一个简单的 GitBook PDF [生成工具](https://github.com/fuergaosi233/gitbook2pdf)，使用下来发觉还不错，于是就封装了这个镜像，希望能够帮助到有同样需求的你。

## 使用方法

如果你生成的电子书包含中文，那么在使用之前，你需要准备至少一个字体文件，比如 `苹方`、`思源`等，将文件保存在你当前目录的 **fonts** 文件夹内。

然后直接使用 DockerHub 官方自动构建的容器镜像，配合文件挂载参数使用即可。

比如我们要将 `http://self-publishing.ebookchain.org` 的内容生成为电子书，只需要执行下面的命令：

```bash
docker run --rm -v `pwd`/fonts:/app/fonts \
                -v `pwd`/output:/app/output \
                soulteary/docker-gitbook-pdf-generator "http://self-publishing.ebookchain.org"
```

稍等片刻，你将会看到下面的内容：

```text
crawl : all done!
Generating pdf,please wait patiently
Generated
```

这时，你当前目录会自动多出一个名为 `output` 的新目录，而电子书就会安静的躺在里面啦。

如果你觉得上面这条命令太过复杂，也可以使用仓库中的 `docker-compose.yml` 模版来进行电子书生成操作，如果你不太会使用，可以围观我博客中 `docker` 相关的使用教程，通常阅读时间都在十分钟左右， Good Luck。

## 其他

如果你对样式有更高的要求，可以使用文件挂载的方式修改 `/app/gitbook.css` 的样式。

如果你想了解更多细节，可以阅读 [这篇博客](https://soulteary.com/2019/05/07/generate-small-gitbook-pdf-using-the-docker-with-python.html)。

## 协议

MIT, For Everyone.
