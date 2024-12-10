/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Genre` table. All the data in the column will be lost.
  - You are about to drop the column `postId` on the `Genre` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Genre` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Genre" DROP CONSTRAINT "Genre_postId_fkey";

-- AlterTable
ALTER TABLE "Genre" DROP COLUMN "createdAt",
DROP COLUMN "postId",
DROP COLUMN "updatedAt",
ALTER COLUMN "name" SET DATA TYPE TEXT;

-- CreateTable
CREATE TABLE "_PostGenres" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_PostGenres_AB_unique" ON "_PostGenres"("A", "B");

-- CreateIndex
CREATE INDEX "_PostGenres_B_index" ON "_PostGenres"("B");

-- AddForeignKey
ALTER TABLE "_PostGenres" ADD CONSTRAINT "_PostGenres_A_fkey" FOREIGN KEY ("A") REFERENCES "Genre"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_PostGenres" ADD CONSTRAINT "_PostGenres_B_fkey" FOREIGN KEY ("B") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;
