Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF77C61DC6
	for <intel-gfx@archiver.kernel.org>; Thu, 27 Aug 2026 12:49:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EB7410F000;
	Thu, 27 Aug 2026 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Krot9wre";
	dkim-atps=neutral
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19DD10F003
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Aug 2026 12:49:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47db714766aso706822f8f.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 27 Aug 2026 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787834954; x=1788439754; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ko9Jj2K+jgJ0qKx5UvXg5fzM+bHwcM2e1OfD7QYdNG8=;
 b=Krot9wreMilnYHi0HEkaifbA2F1WqhiKcb8e4IgFlWPGhoLUuKhsG/68mvZAA9OFLr
 MFJ4/FGCIxljufSIeUyHxiG9Wkxhcw7lqJGGH0jrodF4mBWBPsmRvFH0WW8ESUn5ZyVT
 PGDHe42ILhBoP6NlX4LKaT357AeccVSOBAgsXRZzZa19JQOjBhOrpGKhpIm5qFezACjl
 jS/oTkqr46jrQNRMC51PnpliZlycMJPkDsLGyfiVksHM6pHHbZpPMViczmK3PoNT4EXK
 816tpkQkMy+yp44sgAaPYyfJw7ttDGxi3yKkjUDtZB23pkdTgMkvR2OgZYAtN4cY5naD
 U8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787834954; x=1788439754;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=ko9Jj2K+jgJ0qKx5UvXg5fzM+bHwcM2e1OfD7QYdNG8=;
 b=cGQDLKeGsiRCScmeHe81llL3itd6v9Hq5zxt26RkzJ1S66Ca0MnbD9SLcULy5Wtjl1
 HsUZ++upJYBhkplnG8EA4KoRNutWJeFGTjCGDYe/HTyYnTBfJDtimY0KqqYXRtObDQp9
 SK9rXGqKOGTbIFri1tgCosPIh2S/Ef1oMCLlmxa5MvIahnXMAZOc8HTektWJag7QozgH
 vIhrPoDqb4DM5gXFZjVxaKbOLbup70hHWhWuYoy6q0mpQZW6gbgLPuKEArvkCCXThMOL
 i1sGwEgyWL/J1h43YQRidX0Vz4EG945i8R3p8A+9MZOHL6Okgdzn7DxEeoEUXis64LeH
 9Kcw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrZelVHRWIT194hcTsuEmLI6zlBt3+egtnffO8HVa35lXQRmPMJNFHcrsvjx8omJtRvnjch/ukvwb0=@lists.freedesktop.org
X-Gm-Message-State: AFuF++kc91gb+4VgvC+3wnyu7vKP9dfSHRtS2YENvY13tVC3GrHl3UFs
 sGX6ltH+JB2slIZPqnmcRFXsUBSd0SR5qMOpBdRvl/pyhTIMTjcG3Dix
X-Gm-Gg: AR+sD10sVpm31EuFdKNJgY/hfE9XHTNfrcdq3ltld/f4LU5lyFwMitmW2oge7uv4Kxq
 Z83g7nsoeSGespotssw04e0nGY4in8riYgs5we3fsSuQTKAWgk5RZBG7V2J7xPMz7sTEE+x6V59
 gseo9ra6OEVGcy+q2AaUgtU1G/kec+y2tknppzpK47n7junQ+u4aAOpV7Tx7W80rJdNB2ajm+yL
 /BktXpVWvrL84OBP6G4am7073moRSKN6xkH9UYR/inEzBFikWEMdOtiBAeqvDfVxgnuOgCEmhAe
 zp4ysXwwPyqyj2/h9olXg7ovopZsmX6Mi2Dvyue1Uy4vzjD9DzI0DiWevfIBLl/XqcGY10SOfi9
 zOG+G8zqTyWRXBdWsc+WD69b+fmOo6A6g6VmPSZnpQcoI7ABW4PGuAGYq5J+wk+6FqOD78jtSkc
 lRur6+3dhVikj3gF86QnD6KAEf/dJmRbWndTkr6ijIlcinIdejF2oAjznpaJA9apFAK02beLk3a
 g==
X-Received: by 2002:a05:600d:8653:20b0:49b:e22:4ee4 with SMTP id
 5b1f17b1804b1-49b0e22505bmr57356065e9.4.1787834953901; 
 Thu, 27 Aug 2026 05:49:13 -0700 (PDT)
Received: from able.fritz.box ([2a00:e180:1524:4300:a4b8:720e:f64f:4778])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b465226d8sm52089985e9.0.2026.08.27.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2026 05:49:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas.hellstrom@linux.intel.com, dakr@kernel.org, ecourtney@nvidia.com,
 matthew.brost@intel.com, nat@pixelcluster.dev,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: Refcounting dma_resv v2
Date: Thu, 27 Aug 2026 14:38:48 +0200
Message-ID: <20260827124910.2245-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

Hi everybody,

The idea of ref-counting dma_resv or ww_mutex came up multiple times from
different people, but so far at least I have abandoned that as to
complicated to implement considering how widely used that object is.

Thanks to AI I gave the task to refcount dma_resv to Claude Sonet 4 just
to check how horrible it would look like.

Well turns out that this is actually a cleanup we should most likely aim
for and I'm really wondering why we haven't done it like this in the
first place.

Not only resolves it a bunch of issues with dma_resv instances shared by
multiple GEM objects (we just recently had a bunch of patches for that on
the mailing list), but also allows TTM to implement it's delayed delete
handling without any zombie resurrection or similar hacks and DMA-buf to
have better contention handling on map/pin in the future.

This patch set here is now the idea full flashed out. I smoke tested it
with amdgpu, self tests and checked everything with kmemleak and of hand
it seems to work.

Patch #1 introduces an interim allocated flag to allow switching users
over to the new interface one by one. Patch #10 then removes that flag
again after everything is done.

While AI is an automated tool I distrust it to always generate the same
code. So better using a defensive approach on changing things.

Please review and comment.

Cheers,
Christian.

