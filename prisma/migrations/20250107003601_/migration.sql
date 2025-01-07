/*
  Warnings:

  - Added the required column `category` to the `Post` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Comment" DROP CONSTRAINT "Comment_userId_fkey";

-- DropForeignKey
ALTER TABLE "Like" DROP CONSTRAINT "Like_userId_fkey";

-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- AlterTable
ALTER TABLE "Comment" ALTER COLUMN "content" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Genre" ALTER COLUMN "name" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Image" ALTER COLUMN "url" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "LaunchInfo" ALTER COLUMN "launchDate" DROP NOT NULL,
ALTER COLUMN "marketCap" DROP NOT NULL,
ALTER COLUMN "currentSupply" DROP NOT NULL,
ALTER COLUMN "totalSupply" DROP NOT NULL,
ALTER COLUMN "privateSale" DROP NOT NULL,
ALTER COLUMN "publicSale" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Like" ALTER COLUMN "postId" DROP NOT NULL,
ALTER COLUMN "userId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Link" ALTER COLUMN "postId" DROP NOT NULL,
ALTER COLUMN "url" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Partnership" ALTER COLUMN "link_url" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "Post" ADD COLUMN     "category" VARCHAR(255) NOT NULL,
ALTER COLUMN "market_link" DROP NOT NULL,
ALTER COLUMN "score" DROP NOT NULL,
ALTER COLUMN "investment" DROP NOT NULL,
ALTER COLUMN "token" DROP NOT NULL,
ALTER COLUMN "network" DROP NOT NULL,
ALTER COLUMN "comment_author" DROP NOT NULL,
ALTER COLUMN "authorId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "ProjectFeatures" ALTER COLUMN "title" DROP NOT NULL,
ALTER COLUMN "isFeature" DROP NOT NULL,
ALTER COLUMN "postId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "User" ALTER COLUMN "name" DROP NOT NULL,
ALTER COLUMN "email" DROP NOT NULL,
ALTER COLUMN "password" DROP NOT NULL,
ALTER COLUMN "role" DROP NOT NULL;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_authorId_fkey" FOREIGN KEY ("authorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Like" ADD CONSTRAINT "Like_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;
