Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2B606A31E
	for <intel-gfx@archiver.kernel.org>; Tue, 20 Oct 2026 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=Ri1LuR5a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2C310F54E;
	Tue, 20 Oct 2026 12:53:50 +0000 (UTC)
X-Greylist: delayed 2168 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2026 19:46:17 UTC
Received: from mta1.migadu.com (out-223.mta1.migadu.com [95.215.58.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7262210EAFC
 for <intel-gfx@lists.freedesktop.org>; Mon, 19 Oct 2026 19:46:17 +0000 (UTC)
X-Envelope-To: intel-gfx@lists.freedesktop.org
DKIM-Signature: a=rsa-sha256; bh=R1ooMpzJfDXEJhw31jjPShmqE1PQVzInQ4NZAiNJuwQ=; 
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792439174; v=1; x=1793043974;
 b=Ri1LuR5aaxK2vj22rl68Sxq0q2iPUfe7JUSGom3hSZXEaHTFCmPfy94WxmGsD3kjYqiaaFFE
 Xfh2tOT5BA2Rrc6+SLnaAmJCiw5I7hhxggMeRDGCL4ZTtbxgwRZcI5HYuFq05rjdH1JwSLY5hKX
 l5xwua6MCNWhBIsm02GOuurott6UvFIWs/WVWCgaCkmObHiAJ1Rd+jo506lEKzktr2itMUJ686z
 E5zq3840OLYvo7sPZUIZ9Kwwj65BJtOVGythymixf1eCjmOv3pDocMW8ozjpYBCT/uiUmSosjxj
 YsnwTFkm8lv/4SZtiN1obtmrslqxblYdQ5aFH7E3T2WUA==
X-Envelope-To: intel-gfx@lists.freedesktop.org
Received: by smtp.migadu.com with ESMTPS id d5b732558af1ad71;
 Mon, 19 Oct 2026 19:10:06 +0000
X-Mizu-Trace-ID: d5b732558af1ad71
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Mark Brown <broonie@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 luyuantao <luyuantao@kylinos.cn>, Simona Vetter <simona.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Date: Mon, 19 Oct 2026 12:09:59 -0700
Message-ID: <20261019190959.799653-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <atZBBqj4ON6kYWSK@sirena.co.uk>
References: <atZBBqj4ON6kYWSK@sirena.co.uk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 20 Oct 2026 12:53:43 +0000
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
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Mark,

On Mon, Oct 19, 2026 at 05:10:46PM +0100, Mark Brown wrote:
> This obviously isn't the right merge, it drops the fixes.

Two of those fixes are mine, so I had a go at it. The code that draws
the panic screen was moved into drm_panic_helper.c in drm-next, so two of
the three need to move with it. The third one, for the panic screen
setting, made it through your merge fine. Today's drm-tip has the same
gap.

This puts the two back, on top of your merge:

diff --git a/drivers/gpu/drm/drm_panic_helper.c b/drivers/gpu/drm/drm_panic_helper.c
index 8913c3d22e8d..385a07ed314b 100644
--- a/drivers/gpu/drm/drm_panic_helper.c
+++ b/drivers/gpu/drm/drm_panic_helper.c
@@ -513,7 +513,8 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
 	struct drm_rect r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
 	struct kmsg_dump_iter iter;
-	char kmsg_buf[512];
+	/* the size printk formats one record into, too big for the stack */
+	static char kmsg_buf[2048];
 	size_t kmsg_len;
 	struct drm_panic_line line;
 	int yoffset;
@@ -530,10 +531,15 @@ VISIBLE_IF_KUNIT int drm_panic_helper_draw_screen_kmsg(struct drm_scanout_buffer
 	drm_panic_helper_fill(sb, &r_screen, bg_color);
 
 	kmsg_dump_rewind(&iter);
-	while (kmsg_dump_get_buffer(&iter, false, kmsg_buf, sizeof(kmsg_buf), &kmsg_len)) {
+	while (yoffset >= 0 && kmsg_dump_get_buffer(&iter, false, kmsg_buf,
+	       sizeof(kmsg_buf), &kmsg_len)) {
 		char *start;
 		char *end;
 
+		/* a record that does not fit comes back empty, every time */
+		if (!kmsg_len)
+			break;
+
 		/* ignore terminating NUL and newline */
 		start = kmsg_buf + kmsg_len - 2;
 		end = kmsg_buf + kmsg_len - 1;

I tried it in QEMU on drm-next, ten runs of each:

    after the panic                     your merge   with this
    sysrq c                             reboots      reboots
    one 600 character line              hangs        reboots
    600 characters, then 400 lines      hangs        reboots
    one record over 2048 bytes          hangs        reboots
    oops, 1008 character modules line   hangs        reboots

The drm_panic KUnit tests pass with and without it.

Thanks for catching it,
Devin
