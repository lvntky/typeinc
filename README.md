# typeinc
> Type in C


`typeinc` is a minimalist, static blog system written in pure C. It consists of:

- `bloggen` — a Markdown-to-HTML generator for your posts
- `typeinc` — a lightweight static HTTP server that serves the generated blog

This project was built to learn how the web works under the hood — without frameworks, without JavaScript bloat, and with full control over every byte served.

---

## 📁 Directory Structure
```md
.
├── src/
│ ├── bloggen.c # Static site generator
│ └── typeinc.c # HTTP web server
├── include/ # Custom project headers (included with <project/*.h>)
├── posts/ # Markdown blog posts (input)
├── public/ # Static HTML files (output)
├── Makefile
└── README.md
```

---

## 📦 Features

- Converts Markdown posts to static HTML using [cmark](https://github.com/commonmark/cmark)
- Serves files from the `public/` folder
- MIME type detection for `.html`, `.css`, `.js`, `.png`, `.jpg`
- Simple request routing (`/`, `/post.html`, etc.)
- UNIX-style naming conventions (`blogd` as daemon/server)
- Clean header separation (`#include <project/xxx.h>`)

--- 

## Build Instructions

### Dependencies

Install the CommonMark C library:

```sh
sudo apt install libcmark-dev
```

Compile

```sh
make
```

This will build

- `bloggen` - Then generator
- `blogd` - The web server

Run

```sh
# Convert Markdown to HTML
./bloggen

# Serve the blog on localhost:8080
./typeinc

## 📝 How to Write Posts
Write your blog entries as `.md` files in the `posts/` directory:

```sh
echo "# My First Post" > posts/2025-06-03-first.md
```

Then Generate
```sh
./bloggen
```

It will produce `public/2025-06-03-first.html`

## 📄 Header Usage (for patching etc.)

This project uses <project/foo.h> style includes for internal headers.
To support this structure:
- Place all headers in include/blogd
- Add the flag -Iinclude in the Makefile so they can be used like:
```c
#include <typeinc/server.h>
#include <typeinc/generator.h>
```

## 🔧 Make Targets
```sh
make        # Build bloggen and blogd
make run    # Build, generate, and serve
make clean  # Remove binaries
```

## 🚧 Future Work
- [ ] typeinc as a background daemon (fork, PID file, log rotation)
- [ ] Auto-generation of index.html linking all posts
- [ ] Basic templating system with layout includes
- [ ] YAML front matter parsing for post metadata
- [ ] HTTP caching support (ETag, Last-Modified)
- [ ] Reverse proxy readiness (for Nginx/Apache/HAProxy)

## License
MIT
