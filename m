Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B6606A31F
	for <intel-gfx@archiver.kernel.org>; Mon, 23 Nov 2026 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hyPMsWYf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F13A10EEFD;
	Mon, 23 Nov 2026 15:18:00 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CA410E5E3
 for <intel-gfx@lists.freedesktop.org>; Fri, 20 Nov 2026 02:42:15 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-93a40a9a01aso200231885a.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 19 Nov 2026 18:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795142534; x=1795747334; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8Nzf7HyGQGJipLzRsxdSMLabv2rUKwLHQTs0uFyn5jw=;
 b=hyPMsWYfacIzGmvCvDqucy9V82id/k87iwhemu6I79jinnfAdw19s8vSlvFK5I5KNd
 WhdLJ59VkupRlUkrb5J6CS17VgnLC3REbNkEoAGUWZVmZNcspvGpCBDflDNBRHu98q92
 7CjnBp2Cde+HpeRikIVsbyTzKW6d9/YzkHseM1xAsvIihK8DPY2Tww4nSyKtq9kC7NzB
 Co90PWcUIuH6AbpFaN7kacE7rQqGmF2PZ3ZHYgrDd5uh7GK9O6BwTox8dP8MSBXmcmvD
 ztJOpit/uy9w+Yr2T0pQv/tjKP+hpHORu7jbK/27dDJcuiRNGaAXnVaC2sWGEElMw1eb
 AyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795142534; x=1795747334;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8Nzf7HyGQGJipLzRsxdSMLabv2rUKwLHQTs0uFyn5jw=;
 b=wZ9hmA/kZ7R9qBHxdOd4RO4MKgpQ5I8E7RWz1JeiAYOqyoe2axuI8m4+oM0Rk8F/U2
 mffMD0xNSPNrtNOueeiqKDWwiNCSBV38VDc5WKmfSY8UhyM9W2c8Cn7e0XvwiJQIIbrJ
 zr0F/ekeTwlIYU91Q9C+vK0o3XXssN5uW1wvoNGn8pVgFJPCxZm8EzzJFZr5GclqU8ve
 gRHkZHFVeKHlVrOwfmVlgyEZI+j9DW7ylFbY3bsUPjBIHoGlmTJmBqwakyKC39Gqz3KD
 /hYh8CV8sxlM9B7bzrP+JDXnEUBqpSG/Zzhs9lcv6iVDhk1uR69AJOfndHknrdzAWLA8
 mBqQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHYhtW1HuU0XPFY/6b5GIHg/gN6c+banbZxBsiu3U8eLmA1S501XU0RzW+jxi7+DMdE/sLcSFynP9c=@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Mesc6Hm8qg9QphJV4zDq4Rqx+a+53wJyHgPgwfYlS/77C5CK9
 GN9KMjkPBj6aV0Ged8uo5VGhuPQJjg5M0mIm381RhZ12O610ebBIoyAU
X-Gm-Gg: AYBFou1asy+M0BGlfJnPXDDHdfcPKMg5XpJpp2ECq9S9ru+YM0sj7saQ61Iv1NVUS0C
 sDsrMhATtcK4GOmigwhsOJDy4W/rSiSt74NRmXoT/u1IF2gyttWj+RBkOZcw7xP6fpoNI96rz/0
 c/95q7Bufa0Lih3GWrQ9K8hU4UfTMD1u6Msdnb6d3dxAmaX0kV36UqMJTVFDN7c1mtsHo9qA2T6
 hu2oXHepe1hdK9rB+FU5hqqHAA73TVU85dthSe2uo5JSYwedGXy7cf1nSsLqnX+4r+VgT13Cfx7
 aTCgxwSRgLFJTR8FsMU+Edh+DGMMuft0Bm0CEL9Tx2IUJWhRu5rEPS39PKpH297JhanUWrVf2Jb
 UseMtCyOp/IeVw97OHGMZ70gCMYAWr4KSh7PmutcKIZSn0rP4cixwuxzfVmX6fcKfft+aYlQy/v
 wOuQ3Si1cAVlmyIRZDHwuZrT7iLb0qkTaFEN/LkfJbWNWgB6cDwactGphi8b2NHEF1hh8AtoJuG
 u1aPmfxYO+g6zimfi44R0spbsSlmAk/U/7MhrFRE/EPsMXGrxUA24TMfsEcL9yI+wUnrPib775G
 QiRKWp2HL2LhWdMUbiy7B6f74vqagwGirWMsYrqormt86VNq5ESPwCdOxxdUJTuCJ0kR6thi9cg
 =
X-Received: by 2002:a05:620a:2852:b0:949:8014:70e1 with SMTP id
 af79cd13be357-949ba95ad91mr277788285a.6.1795142533878; 
 Thu, 19 Nov 2026 18:42:13 -0800 (PST)
Received: from linux.. ([8.34.174.240]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-949bb031617sm100514785a.1.2026.11.19.18.42.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 18:42:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] drm/i915/gem: Set the VM owner before publishing the VM
Date: Thu, 19 Nov 2026 21:42:10 -0500
Message-ID: <20261120024210.1658348-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 23 Nov 2026 15:17:58 +0000
X-BeenThere: intel-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel graphics driver community testing & development
 <intel-gfx.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

i915_gem_vm_create_ioctl() adds the VM to the file's VM table before
setting its owner (vm.fpriv). A concurrent lookup can therefore see
the VM without an owner and allocate page tables that are missing
from the client's memory accounting. Concurrent VM destruction can
also free the VM before the owner assignment, causing a write to
freed memory.

Set the owner before inserting the VM into the table with xa_alloc().
If xa_alloc() fails, err_put still releases the VM.

Fixes: ca02a0119f81 ("drm/i915: Record which client owns a VM")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig and W=1.

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
index c58ffa5a8fa6..489b221091d1 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
@@ -1838,6 +1838,8 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 			goto err_put;
 	}
 
+	ppgtt->vm.fpriv = file_priv;
+
 	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
 		       xa_limit_32b, GFP_KERNEL);
 	if (err)
@@ -1845,7 +1847,6 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
 
 	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
 	args->vm_id = id;
-	ppgtt->vm.fpriv = file_priv;
 	return 0;
 
 err_put:

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

