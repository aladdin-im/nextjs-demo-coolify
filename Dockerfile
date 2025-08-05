FROM node:18-alpine

WORKDIR /app

# 复制依赖文件
COPY package*.json pnpm-lock.yaml ./

# 安装 pnpm 和依赖
RUN npm install -g pnpm
RUN pnpm install

# 复制源码
COPY . .

# 构建项目
RUN pnpm build

# 暴露端口
EXPOSE 3000

# 启动项目
CMD ["pnpm", "start"]