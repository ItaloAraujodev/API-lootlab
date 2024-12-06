/*
  Warnings:

  - You are about to drop the column `name` on the `Partnership` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "Partnership" DROP COLUMN "name";

-- CreateTable
CREATE TABLE "Image" (
    "id" TEXT NOT NULL,
    "data" BYTEA NOT NULL,
    "postId" TEXT NOT NULL,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
