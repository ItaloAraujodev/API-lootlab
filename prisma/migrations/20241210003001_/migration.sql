/*
  Warnings:

  - Made the column `postId` on table `Genre` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Genre" DROP CONSTRAINT "Genre_postId_fkey";

-- AlterTable
ALTER TABLE "Genre" ALTER COLUMN "postId" SET NOT NULL;

-- AddForeignKey
ALTER TABLE "Genre" ADD CONSTRAINT "Genre_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
