# typeinc

**typeinc** is a professional-grade, static blog system written in C. It consists of two primary components:

- `typegen`: A high-performance Markdown-to-HTML generator.
- `typed`: A minimal, efficient HTTP server for serving static content.

This project is designed for production use, focusing on speed, simplicity, and system-level transparency. It avoids unnecessary dependencies, ensuring predictable behavior, small binary size, and ease of maintenance.

---

## 📁 Directory Structure

```
.
├── src/                    # Application source files
│   ├── typegen.c           # Markdown-to-HTML generator
│   ├── typed.c             # HTTP server daemon
├── include/typeinc/        # Internal project headers for <typeinc/...>
├── posts/                  # Markdown source files
├── public/                 # Output directory for generated HTML
├── Makefile                # Build system
└── README.md
```

---

## ✨ Features

- Markdown-to-HTML conversion using [cmark](https://github.com/commonmark/cmark)
- Clean, stateless static file server written in pure C
- Precise MIME type resolution for correct browser rendering
- Proper project structure with `<typeinc/*.h>` header includes
- Production-ready `Makefile` with strict compiler flags
- Small, auditable codebase suitable for security-conscious deployments

---

## 🛠️ Build & Usage

### Dependencies

- GCC or Clang
- GNU Make
- `libcmark-dev` for Markdown parsing

```sh
sudo apt install libcmark-dev
```

### Build

```sh
make
```

### Generate Blog Content

```sh
./bin/typegen
```

### Start the Server

```sh
./bin/typed
```

Accessible at [http://localhost:8080](http://localhost:8080).

---

## 📝 Writing Content

Write blog posts in `posts/` as Markdown files:

```sh
echo "# My Post" > posts/first-post.md
./bin/typegen
```

HTML will be emitted into the `public/` folder. The server will serve these directly.

---

## 🔧 Development & Header Style

All internal headers reside in `include/typeinc/` and are included using:

```c
#include <typeinc/generator.h>
#include <typeinc/server.h>
```

This is enabled by compiling with `-Iinclude`.

---

## 🧩 Make Targets

| Target       | Description                          |
|--------------|--------------------------------------|
| `make`       | Builds both `typegen` and `typed`     |
| `make run`   | Regenerates content and runs server   |
| `make clean` | Removes all build artifacts           |

---

## 📈 Roadmap

- [ ] `typed` daemonization support (PID/logs/signals)
- [ ] Auto-index generator for `index.html`
- [ ] YAML front-matter parsing
- [ ] HTTP caching and ETag support
- [ ] TLS support via reverse proxy or native mode

---

## 📜 License

This project is licensed under the MIT License. See `LICENSE` for full terms.
