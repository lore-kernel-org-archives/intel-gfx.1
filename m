Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA08CD8CA4
	for <intel-gfx@archiver.kernel.org>; Tue,  9 Jun 2026 13:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1E10E3BA;
	Tue,  9 Jun 2026 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N4UIH4te";
	dkim-atps=neutral
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891BD10E1D5
 for <intel-gfx@lists.freedesktop.org>; Tue,  9 Jun 2026 09:32:01 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-beb1bee8c16so689491966b.0
 for <intel-gfx@lists.freedesktop.org>; Tue, 09 Jun 2026 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780997520; x=1781602320; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LWQ2fsM6Lbb4TBMtDn9FvYlyKisjzRyBmoFcUvRD0XE=;
 b=N4UIH4textgHlMBwUepUMU7K51La9r1t2qQA1NmFChkJjhYybqY795BWkqEpu0Nwd7
 TTG3+ceCRiZJnhmI+IrJkl0Mpt9Q1nb/QTpP9yb9bqqjxJpn6pCj31svF3pA+W1jjN+Y
 16kdNS83miU7esRvyIQ14Jb1ZPRTOzZq5n/Iv9Z0GzIMKpOrI0dAF3WM19X9rX+SeXJp
 9HHXhEA1n1TpxMLOaMH5fZAUuK/xYkkoklELqoN+kOWN4ORXvb5YZq7vKbeKM8iEq6rH
 U7w3RKamlysjzV4+HVIYK47y6iw71NjNvL+9pno/eKCNLBph7qp8/dIEondusXB0T47C
 fiDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780997520; x=1781602320;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LWQ2fsM6Lbb4TBMtDn9FvYlyKisjzRyBmoFcUvRD0XE=;
 b=ikkRWn/0KJFsqhd0TUBukkskBCOx1NUm/Azst34MqA9FuPdUDvcAJ3mkutcLzqq3Ia
 xYZxRw7FTqddOOPZb/WXjlRkltG4mJY3JpjeExy8Ulk9m5tJ7u9BcHS2k62Zm7XgiFd2
 oUR97emfXUKqy2T0nZp/aPBoJ15Uto60kVznCxsgBv13sDRTFO1t4zT2mhFCnThDwD6h
 hu1FH7JpAJAhcu3qXZZGwNNq6WWxYz5U/bIHpdFlIlMxBiL5OdEv/C/pvB5Le7SzLHC1
 M6YIBmDJXki4vebuD/VFz4o0KDHNT5QGbEklGIhCYstott1uaytmehc8EY4kfwO2FGYB
 JQHw==
X-Gm-Message-State: AOJu0Yz7+QTDlS6J2MVPt/k5B49ajXmOIaURIO0MEyCASQb0WToMm3OG
 T4pWGIMh/PqEW7Mkm7Y//8JJBUxL1W/k99W5Y+AkMKm47O8Q0FOl/j/Z1Jrm8mwyCQVpsw==
X-Gm-Gg: Acq92OGDcdK/jnEA6JYEUuFjzmxqfPHW8OEMXxhvtYaURQ4VpTl0aiMkoQa2i6wjpIH
 qOu5yOsHRapjuAyj3FHwZZW4KQ0GwUuW8YQRMKFcogl9wwKcWP7elObjKXzqwYfxag5+G51PP59
 HB9guUmgT9L+qjfQKRE74wMqgU21x++7GZabw+Q6ZYyVFUyHlPm8N9KRLn+meZJdioGocZr+RRe
 2IZyy1E9321nWUw9NV2DV0rN5D8zIiSpuRGNwwKrafikDNYI6bsfTHJp+7hUmsqSt1EiFKbBhZT
 tD8WIXOJd8B0z/8c1ZFU26SNfkrWR36u4mTCHXVaK2lGrecshlYF1mmyQ9PYAUirFrRVBB4x5h+
 wKsmmRWzx70zAIzQfGssFveKgmuCwI5U6aN58ZH+MN7ZcAAzrTcPz5bLQYTBUGHZuO78p8eaNa5
 S7M4PtkQRvsnbrplHfKykjIAiYd77+0N5qmPyWBLaiCJ8nIDg4tprXypgrN/w7ULKRGK9ZjaQWv
 4Kq1HJO5g==
X-Received: by 2002:a17:906:318e:b0:bd3:7514:14f3 with SMTP id
 a640c23a62f3a-bf3a6b0f103mr559535366b.11.1780997519627; 
 Tue, 09 Jun 2026 02:31:59 -0700 (PDT)
Received: from JTOLLET-M-FKW7.cisco.com
 ([2603:5004:20a0:100c:4e0a:b38b:df87:2d8a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bf0559f1f62sm1027272266b.57.2026.06.09.02.31.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Jun 2026 02:31:59 -0700 (PDT)
From: Jerome Tollet <jerome.tollet@gmail.com>
To: ankit.k.nautiyal@intel.com,
	ville.syrjala@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 arun.r.murthy@intel.com
Subject: Re: [RESEND] drm/i915/hdmi: Poll for 200 msec for
 TMDS_Scrambler_Status
Date: Tue,  9 Jun 2026 11:31:56 +0200
Message-ID: <20260609093156.86410-1-jerome.tollet@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529045621.82540-1-jerome.tollet@gmail.com>
References: <20260520022544.3097252-1-ankit.k.nautiyal@intel.com>
 <20260529045621.82540-1-jerome.tollet@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 09 Jun 2026 13:54:41 +0000
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

Hi Ankit, Ville,

Just following up now that my previous ping appears to have been approved by
the lists only on June 1.

Patchwork still shows rev5 as New, with CI passing and Arun's Reviewed-by
present:
https://patchwork.freedesktop.org/patch/726364/

Is there anything still blocking this from being picked up?

Thanks,
Jerome
