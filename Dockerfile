# Dockerfile for livekit-agent-starter-react

# ---- 1. 构建阶段 (Builder Stage) ----
FROM node:22-alpine AS builder

# 安装 pnpm
RUN npm install -g pnpm

# 设置工作目录
WORKDIR /app

# 复制依赖描述文件
COPY package.json pnpm-lock.yaml ./

# 安装所有依赖
RUN pnpm install

# ---- 2. 运行阶段 (Runner Stage) ----
FROM node:22-alpine AS runner

# 安装 pnpm
RUN npm install -g pnpm

# 设置工作目录
WORKDIR /app

# 从 builder 阶段复制 node_modules
COPY --from=builder /app/node_modules ./node_modules

# 复制所有源代码 (包括 .env.local)
COPY . .

# 暴露端口 (Next.js 开发服务器端口)
EXPOSE 3010

# 设置环境变量
ENV NODE_ENV=development

# 启动命令 - 使用开发模式
CMD ["pnpm", "dev", "-p", "3010"]
