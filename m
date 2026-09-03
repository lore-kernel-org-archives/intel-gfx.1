Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDF3C79F80
	for <intel-gfx@archiver.kernel.org>; Thu,  3 Sep 2026 16:00:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4CE10F6AA;
	Thu,  3 Sep 2026 16:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="p+yHKLOU";
	dkim-atps=neutral
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B454510F5AC
 for <intel-gfx@lists.freedesktop.org>; Thu,  3 Sep 2026 13:14:33 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-90cc39e06bdso25917866d6.0
 for <intel-gfx@lists.freedesktop.org>; Thu, 03 Sep 2026 06:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1788441272;
 x=1789046072; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fI50F7BC1P+zeX5uS6qAgaZ+kpRVSjzAsyT5yWCuILk=;
 b=p+yHKLOUefIF7Nj/HelQV8N7d8Oqqw1RZuUGV8s943KBWtVCvJyi+CyJKuaSuMDqFi
 cENI4cyp5kkQh44kx0sMB1ehIAvlfgbOo4e4rez8Gool26DGCelWE3uYY89co4Jo2/ci
 ImSRkeIFMGwRW4Ztl4gf5FV10eGc+zNegr4NkXWEYNkhokb18MzjH3gMfGI8B7yxp39u
 4u6O4D0QsxrjWwZjBiUCCugex6nWQdI3FiqCSGykgbi2VB6ecLQoZYer5Yy3aRptrJlx
 TIZD5sXeBe7Ur1aXucBxdiyDp0B35fVVneK2Vndmcdua9xxjdpRZ6+F4NKlCP/9bAHYn
 ivaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788441272; x=1789046072;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fI50F7BC1P+zeX5uS6qAgaZ+kpRVSjzAsyT5yWCuILk=;
 b=bLvsm2ce2HZYcDYjnfBKOXah7DPN4bo04vVTomRvRfs0zWrbK+rnBHBvWF8jeX8UZm
 B25zwFFwF7MGMX42WWp9t8CnIiAbrssl6MNxwZs5lSK8Rlu0rzpJnT0iuJbKUrlj3dQx
 wY9D8xtrvM+2LxqZ0cBrOu6y0KfFYxQQ83zC5CZAhbtRWt7O59QRXFxHmYw29klpg7YG
 ruLYKFWn1DmRkXzhSsw6OklhMIM7j4tAm81SO9HZs+ZACwAe+Q6aC6nJ0yahR62R3jN0
 6eQlYNbHBT1ZJihzi4uHsj3jor6ewLOEbY/2gFM1Pm3hf1oqhp4fg+2+or4bFyDnd9+6
 4ZiA==
X-Gm-Message-State: AFuF++m2TAY/gXAPnA2XDqTFttlOzs5svBlfvQ1LU1bRoCmJuMszpbl8
 jQdzL9NddWzQMr4UThj+nE3zF2ffamdOfpcTllSDEdXWkk6GT+MP8BIP5ZQXH3/OeQk0gxNA4UV
 XBp7fmzER52D5Kz8UzqmCpVSwrqey7laI0TR6Wrq9pI47mnEwuzBs7TtwdMKUQh9gyHXpdbBX52
 CiNOBJEaA0ClDA4RzGUAGf+/VEKBqEp5/IAx34VFBXYZbAxQ/wUzsypTI=
X-Gm-Gg: AYBFou0ejdtxqCZoyZ5Ss1oks5Zizj9ZJPwJrq/MNetTMZ1KSDoJYrOdyxvXSzn1Zdu
 0qpRXerkRMlWIdx062iHuRJSuVKQOikF5x6bQMSOjLr7D1fUk4xkrqU2sCDWnKlQ1WnLUcjufRt
 tTG+lelPZgQs3RC+KxwiZ+mEb1MlwVZ3nf8O9CV36cgHTVFOLsJ4PblFxtUaIkvGEob1bPJgEQk
 k0t8SVi4f2bw9LnOoo5M9T62tEF3VW66x0qrlqj1EQ2WQnO1DCLy3+nf+r/sK7u70N3y9EOwMF8
 SQ9jrot/tcH5NYd3RXvag21BvQrZ+rFRpQQCpgN0bVMAs8orl1lnFUfIiRK7bZeWWM29ngtjatC
 8cb+5I4+SptHHs7BI01fMLSboMeswR5DzWDfMcdCTxKtKvXzJ2W1TSZAmxlIDeL9UrEKomvgM6F
 hQFSAElIM+69H4iYDD+aV/lKHDLXeDfQBhd09+f3VD2JdPHnj0nPFDlIhw1BlCbaCx2od+7jdco
 U9hXfoaF1YHLeoKrG2ROik70P61Iajq8YFkGWulo1fz4aar05mB2/iW0l4Z3uCQow7jqDZ42NNv
 E+rcXUUb3Irr+6hqL9Z3lowhqRyw0JoJCdWKwWXBIPBHqPlDLso5wD/NS+w=
X-Received: by 2002:ac8:7d51:0:b0:52d:824c:4856 with SMTP id
 d75a77b69052e-53036d12e8cmr114697601cf.31.1788441272177; 
 Thu, 03 Sep 2026 06:14:32 -0700 (PDT)
Received: from jake-laptop ([74.244.125.34]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-530434bd168sm20388111cf.2.2026.09.03.06.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2026 06:14:31 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/i915/alpm: Keep the extended fast wake ahead of the
 IO buffer wake
Date: Thu,  3 Sep 2026 09:14:29 -0400
Message-ID: <20260903131429.44150-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902162531.73598-1-j@metarealtyinc.ca>
References: <20260902162531.73598-1-j@metarealtyinc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 03 Sep 2026 16:00:11 +0000
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

On Wed, 2026-09-03 Jouni Högander wrote:
> Thank you for the patch. Have you tried increasing vblank/guardband
> alone?
> ...
> Have you tried fiddling with the fast wake sync pulse count? See
> driver/gpu/drm/i915/display/intel_dp_auc.c:intel_dp_aux_fw_sync_len.

Tried both today. Each run is 15 s of PSR2 with DP_PSR_ERROR_STATUS
polled every 200 ms and cleared after every read, so the number is how
many polls found the Link CRC error bit set again:

  io/fast 11/11, guardband 60 (stock)          70 of 71
  io/fast 11/11, guardband 127 (full vblank)   70 of 70
  fw sync len 20 -> io/fast 12/12              68 of 69
  fw sync len 24 -> io/fast 13/13              69 of 70
  io/fast 11/12 (this patch)                    0 of 71

Guardband and sync pulse length make no difference, and moving both
wake times up together doesn't either. Only fast > io does.

> Your change is conflicting with the spec. It might be a trace to the
> actual problem.

Understood. I'll respin it as a quirk for this panel (LG, sink OUI
00:22:b9, the DA14260/DA16260 pair) unless you prefer a different key.
DPCD OUI quirk or the device id table next to the Panel Replay entry,
whichever you want.

For what it's worth, with the stock 11/11 the screen keeps updating
under PSR2 only because every wake fails and the sink resyncs (0x2008
reads 3 the whole time). With the wake clean, the SU problem from the
other thread is what you get.

Jake
