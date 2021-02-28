Return-Path: <SRS0=Mptj=H7=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4100AC433E0
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 14:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1BEB64DBD
	for <intel-gfx@archiver.kernel.org>; Mon,  1 Mar 2021 14:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1BEB64DBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E589E5B;
	Mon,  1 Mar 2021 14:52:14 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AFB789D4F
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Feb 2021 20:05:49 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id m1so12495088wml.2
 for <intel-gfx@lists.freedesktop.org>; Sun, 28 Feb 2021 12:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dWVBoZRuq7mTfadSRGePj84wl37X9sEueBfkpRpUOh8=;
 b=g2xSrFWIeL6b2uFVWv6tkU2MuVY/AqT+WeUq8ix9OD+b6KXHoxI9KAWF/Bg7IaiRe6
 m5EH9EZFOXK9G2BGwefYNKv1mXoDNS6pv1m43AfP3BTyGWzmHCSJXQAjAdfC0viU8sQi
 XijaQXx9fleyatklK7nqaLDEykvzO2isBTHZcXh7TX0azkd8YdUSnlXVC9qR0SsV7b11
 SiD3c6oavTKsPDKDz42JgtxaCnu74F+K/2KqR7Y+T5JYYBIgeV3BGfYWJFeDjgviDIPW
 uYsE5KXN6LBey7pIS14MmZCZ1vxxFQP3u70L2PjUv2yEYjyGJzoWqvvuRNwMiuN97iLX
 pnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dWVBoZRuq7mTfadSRGePj84wl37X9sEueBfkpRpUOh8=;
 b=JpAvoh9vG0LDT37/y6Q+25LtyoKV68nQgUnWN2qd19d/TAALZ5EiM1bNq+8yp3YsH4
 ZWkRenN5argb/2+SJ9gvjj/zkv6QLS9XDojYXrN0nO7SD1M3U3IFYDgvQ73nRdyS4Wpi
 t03qow7YvLilpu5VgQ/xV8j0Ca79d2xM3QWpQg8MVpjogqEsQ0WDXC1zWefDGBXJCBOW
 yXY+YckapPFdu97qqag5QefiDhQuaP12Newo9IWg2TYAjZQgI0qvJzKFYhB2oqTnVWT6
 CNdFsTxFnxMTcm7acULHfL74PZ/uhsHCgchOIHgrfbwxuN1DY9Tj+8hcORUrYaJlx33P
 yocA==
X-Gm-Message-State: AOAM532/vYlvOlPvolAFUhtVqSGxoJgfE2o+fqK846LSJwMslkTxv+jG
 szR8eDjwVw3coXwu14ijJKc=
X-Google-Smtp-Source: ABdhPJwURWrom/4l/wV8bSRkMZxcathM8dQ5BtHmdOwsW2K3E9/OzD2zddnFna3pjnZWD6aZgKr3Gg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr12688651wmq.159.1614542748564; 
 Sun, 28 Feb 2021 12:05:48 -0800 (PST)
Received: from archlinux.localnet (80.142.94.90.dynamic.jazztel.es.
 [90.94.142.80])
 by smtp.gmail.com with ESMTPSA id n66sm19968862wmn.25.2021.02.28.12.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 12:05:47 -0800 (PST)
From: Diego Calleja <diegocg@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 28 Feb 2021 21:05:45 +0100
Message-ID: <1911334.sV3ZJath2r@archlinux>
In-Reply-To: <YDuzbvIjMO5mFcYm@kroah.com>
References: <3423617.kz1aARBMGD@archlinux> <YDuzbvIjMO5mFcYm@kroah.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 01 Mar 2021 14:52:13 +0000
Subject: Re: [Intel-gfx] -stable regression in Intel graphics,
 introduced in Linux 5.10.9
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

El domingo, 28 de febrero de 2021 16:14:54 (CET) Greg KH escribi=F3:
> Is this the same issue reported here:
> 	https://lore.kernel.org/r/f1070486-891a-8ec0-0390-b9aeb03178ce@redhat.com
> ?

I just tested current mainline (which already contains the three commits me=
ntioned in the bugzilla),
and the problems have disappeared.

Regards.


_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
