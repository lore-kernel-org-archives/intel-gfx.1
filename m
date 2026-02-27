Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5C2FEFB47
	for <intel-gfx@archiver.kernel.org>; Fri, 27 Feb 2026 13:31:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E80310EB51;
	Fri, 27 Feb 2026 13:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="CtvnOGc6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YINw6qBY";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="CtvnOGc6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="YINw6qBY";
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE6510EB4E
 for <intel-gfx@lists.freedesktop.org>; Fri, 27 Feb 2026 13:31:25 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 49E203FF36;
 Fri, 27 Feb 2026 13:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GdgX+o1MuX3ZIs/ui5OIh3ziP66JlM3qEMo944zcnYQ=;
 b=CtvnOGc60tSdhp+hM+ww8fKZy8TmyO1bUlGNcvvQrNoB9DC5KHdsnCUHEQYz1+kjny5HM4
 /RE47UQ3AJlsaPgxVrfpNm1lyptxx2LqK2iJ7i4yG7L4F0enTiJwSH3BBodJi9NqVZx+9h
 d33hx/jNLCEVrUYEuqgljit4Yl0zA0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GdgX+o1MuX3ZIs/ui5OIh3ziP66JlM3qEMo944zcnYQ=;
 b=YINw6qBYWBTg7Teo0uSXlZSkxM7oiXdWHChEDp38z/DQeo82/Kk6rvk19xvra3LSgkaG6G
 MYnwL+0UdRgVkvCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1772199084; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GdgX+o1MuX3ZIs/ui5OIh3ziP66JlM3qEMo944zcnYQ=;
 b=CtvnOGc60tSdhp+hM+ww8fKZy8TmyO1bUlGNcvvQrNoB9DC5KHdsnCUHEQYz1+kjny5HM4
 /RE47UQ3AJlsaPgxVrfpNm1lyptxx2LqK2iJ7i4yG7L4F0enTiJwSH3BBodJi9NqVZx+9h
 d33hx/jNLCEVrUYEuqgljit4Yl0zA0g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1772199084;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=GdgX+o1MuX3ZIs/ui5OIh3ziP66JlM3qEMo944zcnYQ=;
 b=YINw6qBYWBTg7Teo0uSXlZSkxM7oiXdWHChEDp38z/DQeo82/Kk6rvk19xvra3LSgkaG6G
 MYnwL+0UdRgVkvCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F1D2E3EA6A;
 Fri, 27 Feb 2026 13:31:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 0KXXOaucoWkrLQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Feb 2026 13:31:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Test for imported buffers with drm_gem_is_imported()
Date: Fri, 27 Feb 2026 14:31:04 +0100
Message-ID: <20260227133113.235940-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 R_MISSING_CHARSET(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-0.997];
 MIME_GOOD(-0.10)[text/plain]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 FUZZY_RATELIMITED(0.00)[rspamd.com]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,suse.de:mid,suse.de:email];
 FROM_EQ_ENVFROM(0.00)[]; RCPT_COUNT_SEVEN(0.00)[11];
 RCVD_COUNT_TWO(0.00)[2];
 FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FREEMAIL_ENVRCPT(0.00)[gmail.com]
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

Instead of testing import_attach for imported GEM buffers, invoke
drm_gem_is_imported() to do the test. The test itself does not change.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: intel-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index 3f6f040c359d..798c920160cf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -372,12 +372,12 @@ void __i915_gem_object_pages_fini(struct drm_i915_gem_object *obj)
 	 * and ttm_bo_cleanup_memtype_use() shouldn't be invoked for
 	 * dma-buf, so it's safe to take the lock.
 	 */
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		i915_gem_object_lock(obj, NULL);
 
 	__i915_gem_object_put_pages(obj);
 
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		i915_gem_object_unlock(obj);
 
 	GEM_BUG_ON(i915_gem_object_has_pages(obj));
@@ -391,7 +391,7 @@ void __i915_gem_free_object(struct drm_i915_gem_object *obj)
 
 	bitmap_free(obj->bit_17);
 
-	if (obj->base.import_attach)
+	if (drm_gem_is_imported(&obj->base))
 		drm_prime_gem_destroy(&obj->base, NULL);
 
 	drm_gem_free_mmap_offset(&obj->base);
-- 
2.52.0

