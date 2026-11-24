Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3DE606A31E
	for <intel-gfx@archiver.kernel.org>; Wed, 25 Nov 2026 14:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc.ca header.i=@metarealtyinc.ca header.a=rsa-sha256 header.s=google header.b=WEjOfnom
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3676A10FCD8;
	Wed, 25 Nov 2026 14:59:03 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204E010F668
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 15:37:03 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-92134c4592dso42098416d6.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 24 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc.ca; s=google; t=1795534622; x=1796139422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=WEjOfnomNHjQOjx3P/PxEqb/dlFspbhU39mLb0Lw1veC7C5O00GVQN8ve5fJkizXuw
 mTSo/eL36JIQrspIRQ7psOJf0NtYpun8qYc2c0T2IeWaxIF/xHtG/yRYZCtObfjQGRcr
 MvFOqql3sMsbTTtf25LK5JSUKl1X+FMe9ZD90Vg5GU6WZsVKZP3WzbfYKdXKWfBVlLQW
 kojbm3t4edzoTWmPewVtWjlMBMR+A4qPYNjow1L20RXg5y5BvMlfSasRg+VWbGkub944
 D1m9C/1+oQJ7GjJYWYKva8HjpisLCa2cI/wQiVUQzcJkXOqelztcOcyq1en/6QL+BRgz
 5G6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795534622; x=1796139422;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ZfJPa8uUh2EsffvwpmDril+FeS3X90n3oLx7atj56Zs=;
 b=hZ+JHWBPLri0fFufD8nBKPnn3eVxmzOEcYwj7Cf9fElmJC9aJllKUAdlZPE+pfAz9E
 aEzPnkMGooCoWyUmZTAm+BeIb5pkf9jULs928mVeDJ2vtcyOiDGPHbspG3koef1cC6tq
 117YFNQKi6IlwhcfpVLmbc0kNz23rp6JQeEEB5v8XTaCYfQbOIgCRE3zV1SGqPwEhY22
 d1BG2wtOZ13e3aK2Gp9ifEMfWi/z9b49K9dYF9CYwOk6MYI9/x4HiD0dCFiT55p7N1rw
 GzLbb9ro5ZSytU2Fq0sbUyPVHizCwSDmH+3/Hi//25DqegLQC5UU+Em5kz2kHxJSN4H0
 eFWg==
X-Gm-Message-State: APuU4Z+idPj7RleG2P14fVRI+R4SvOJ0hgL2QmEJ2E9UWSc5glFfUfEh
 uwAgkRux1mVkegK6YA3lgKNQjphWbL9GNxym4Otbq+opT2b+3P8QLTm+Q7TxLnNgg78=
X-Gm-Gg: AZFdTZeZV086WISz2PG4L1eos/DAsGCg4OCU9CiVYgN3tyBOFAoedXTGC0aSjFi/25O
 AT7cO5fok3YriCbsN+AePGrJgqCDItLutr2GfXykK5QGXrK4+dUOd0b05Ws73GpqQ1HAT1v3mvn
 5hYUdF6IKeJVoT+Dx0DUKnwgpbkDp0Ofdlbfkm5dx2kL//JNW/GFQ6CRFy6LcwXfjnQkiuUrcwp
 6x+ay8nz6dvNz+tPrt7ttnWEvD427RdWGkznX4ZmlKw/Z73jthPeALEssips9A2BEI+iG0K8LIV
 tYYjXYK4LE0K7SbsvkW+amsaFRKyZJK7NAZk/dxn7SBY9EJ3xbZWXsGUH/LYNFlvQTDYo7uBjzz
 zU1YckN01QWbbv+F15t6MHqBevU33NYvZwubcr+koEW7juiP433xXFj2PSg8kmI7yt/VsmLmSW6
 h3qNwACrbQxpO6j0nmrRKFsfL2bEnJVJrwkz1tSNAKbe/MgZsD+mHNI5SDQ+rYflwNMXm9jmE49
 GLBmMhGbLhwAw6PHlDPjPhLrXfjB6xS7wpQZ/4IWhivtyUrkA/5wky0dofRFD7E9ilvk99zr0jN
 SzpU+b3AvmZiFjAHNW+FIxdEGRW+25xnb0On4SSwVgSddBmn4MU7gAYXZEsNZyeFnhbs7w182e5
 akWO3XeQ9J0n+3U3/aSM032Ai2nojeCC0KoBH3c17JFRz8IK0n9I3jbbQU0ObZXWxQJgbr9PXZ1
 FeEb56po5weeubnadLcHBCulLLcma2ATvzj/NQ/oCbGPqMl+vodC7BikpPd4g1+jbQtV48+tZ/N
 VBYrmIvE/myeg==
X-Received: by 2002:a05:620a:8081:b0:93b:d7a3:45cf with SMTP id
 af79cd13be357-949ba9e882fmr2493492185a.56.1795534621955; 
 Tue, 24 Nov 2026 07:37:01 -0800 (PST)
Received: from jake-laptop ([2607:fea8:c6:a700::ec62])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-94a0175c67fsm26215985a.31.2026.11.24.07.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 07:37:01 -0800 (PST)
From: Jake Steinman <j@metarealtyinc.ca>
To: jouni.hogander@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 animesh.manna@intel.com, ankit.k.nautiyal@intel.com, uma.shankar@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: [PATCH v3 4/4] drm/i915/display: Remove the Panel Replay quirk for
 Dell XPS 16 DA16260
Date: Tue, 24 Nov 2026 10:36:55 -0500
Message-ID: <3a76c676f2d4a1785dcaa42ebb76bc8fd9bba405.1795527921.git.j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795527921.git.j@metarealtyinc.ca>
References: <3077ed0636a6c98e919934d2c860461f98222537.camel@intel.com>
 <cover.1795527921.git.j@metarealtyinc.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 25 Nov 2026 14:59:02 +0000
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Panel Replay was disabled on the Dell XPS 16 DA16260 because the panel
judders with it. The judder comes from the AS SDP being suspended in PR
Active, which the previous patches fix by sending it while frames are
being updated. Panel Replay Selective Update works on this
laptop now, so remove the quirk.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/9119
Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Jake Steinman <j@metarealtyinc.ca>
---
 drivers/gpu/drm/i915/display/intel_quirks.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 96eb9a40d..6070440f8 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -289,14 +289,6 @@ static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
 		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
 		.hook = quirk_disable_edp_panel_replay,
 	},
-	/* Dell XPS 16 DA16260 */
-	{
-		.device = DEVICE_ID_ANY,
-		.subsystem_vendor = 0x1028,
-		.subsystem_device = 0x0dba,
-		.sink_oui = SINK_OUI(0x00, 0x22, 0xb9),
-		.hook = quirk_disable_edp_panel_replay,
-	},
 	/* TUXEDO InsanityBook 15 v1 */
 	{
 		.device = 0x591b,
-- 
2.56.1

