# Web Crawling

Web crawling describes the automated retrieval of content on the [web](/wiki/web.md) by search
engines, indexers and other automated clients.
Websites can provide rules to influence how compliant crawlers access and index their content.

## Usage

This section addresses the configuration of web crawlers.

### robots.txt

The `robots.txt` file can be used to instruct compliant web crawlers which paths of a website should
not be crawled.
The file has to be available at `/robots.txt`.
To prevent crawling of the complete website use the following configuration.

```txt
User-agent: *
Disallow: /
```

The `robots.txt` file is only an instruction for compliant crawlers and does not provide access
control.
Crawlers may ignore these rules.
