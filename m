Return-Path: <SRS0=a3P7=L6=lists.freedesktop.org=intel-gfx-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB28DC07E99
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 03:24:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6176861353
	for <intel-gfx@archiver.kernel.org>; Tue,  6 Jul 2021 03:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6176861353
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=intel-gfx-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B4C89956;
	Tue,  6 Jul 2021 03:24:35 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB8389956
 for <intel-gfx@lists.freedesktop.org>; Tue,  6 Jul 2021 03:24:34 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id b13so32137106ybk.4
 for <intel-gfx@lists.freedesktop.org>; Mon, 05 Jul 2021 20:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Ji6lXGuoP7HameM3ebKucNbDqX+ADatotTR0zt54z5M=;
 b=RbKIcIAfJlvIYtkm6NA0OQH5HMPDtPF0hG+avdCoLmgb3jhVyu5RxI0kBNEMURnfGp
 9J4tES3P3pBIAU46x9Xn6PpMwmMcZ9+VoLjXOmfFB0ZNLdCJ1MpKEaiTFgTDPbz0JB79
 oVUUzKJAwlw524qb5Zdw1suFAcdRXnpBzwMauDh4g9dBH1L2ZF6lbVs2dGYc2mSQ+SWq
 X3tw3FGHyBcwipBrC9j1LlXF2V9YaG+9JmzCl7XvWqAlqVXxUE/M21DHHbObPBlpeZQX
 10LUjArCc2tbkD1uM8EbDEcFG47XnBtRCLuTMHnnr3VvQvk+0BbB8BAx9nRjmVUFKmoL
 aIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Ji6lXGuoP7HameM3ebKucNbDqX+ADatotTR0zt54z5M=;
 b=W40eMSHrgxw+jHsbu7Z45bktqw/bqZNRPhU5siL8RhKTqUHpTNHYbNRJkXV2PzRSbn
 AOOwfI5clONDQlHsNPgFh8kSQhynTmPesRQuk15hoy4YXDHcH/dhV4fVa22BkL0F+b26
 uvm7i9qAFLBn8+zg+t4FAHX2PIhNDroHy4WT6HAn5ICyYmA1RwfbxsfKXdrTYwjLcgGz
 rRD15A46KqoDnC6rvxlNrf4lYm5cHpSMl2JvYHMlsUnMmf/VdF5d7KzR4b/79rE8G25h
 5HnC7ESwfFSXcpg/am/3z3HzydJeOzevezs9dqRIXJcPYfdNX3tvi6TuKQMBJM5xaUQe
 bI7A==
X-Gm-Message-State: AOAM531et+z4pMmyE4iexl1CCggp2WRDVe6cRBxwD0GYSBzilrh0w6Jr
 0qGYBkc5I3ctSD1Uy1Byub2ATdmFjAhAZhO6G1Na0SoR
X-Google-Smtp-Source: ABdhPJyuvAC7QTRbQMjS0ocJxJPGVQgs3oIukRcZpkNZuJqNlwogwCq3WsSEZoohhkXTj/sIXCKBI6jwYjN45ICBOuE=
X-Received: by 2002:a25:8151:: with SMTP id j17mr22089530ybm.321.1625541873696; 
 Mon, 05 Jul 2021 20:24:33 -0700 (PDT)
MIME-Version: 1.0
From: ri cha <hentaiwushuang@gmail.com>
Date: Tue, 6 Jul 2021 11:24:19 +0800
Message-ID: <CACCqD2LMGhOKYD92LUJ0=1bOk-qnEPtE29APV7PKpE6G4Kzc=g@mail.gmail.com>
To: intel-gfx@lists.freedesktop.org
Subject: [Intel-gfx] Are there any plans to write SR-IOV drivers for Intel
 XE graphics cards?
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
Content-Type: multipart/mixed; boundary="===============0726351038=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>

--===============0726351038==
Content-Type: multipart/alternative; boundary="000000000000f303f505c66bf577"

--000000000000f303f505c66bf577
Content-Type: text/plain; charset="UTF-8"

The customer service informed me that the Intel XE graphics card supports
SR-IOV, which is used to replace the removed GVT. But the SR-IOV driver of
Intel XE graphics card does not appear in the Linux kernel. Is there any
plan to write the SR-IOV driver?

--000000000000f303f505c66bf577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The customer service informed me that the Intel XE graphi=
cs card supports SR-IOV, which is used to replace the removed GVT.  But the=
 SR-IOV driver of Intel XE graphics card does not appear in the Linux kerne=
l. Is there any plan to write the SR-IOV driver?</div>

--000000000000f303f505c66bf577--

--===============0726351038==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0726351038==--
